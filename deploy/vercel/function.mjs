// Node entry for the gateway on Vercel (D33): turns the Node request into a Web
// Request, puts back the path the route rewrote into ?__path=, and calls the bundled
// handler (gateway.mjs, built from functions/gateway/vercel_entry.ts).
import { GET, OPTIONS, POST } from "./gateway.mjs";

const handlers = { GET, POST, OPTIONS };
const MAX_BODY = 300 * 1024;

export default async function (req, res) {
  const url = new URL(req.url, `https://${req.headers.host ?? "localhost"}`);
  const rest = url.searchParams.get("__path");
  if (rest !== null) {
    url.pathname = `/api/gateway/${rest}`;
    url.searchParams.delete("__path");
  }
  const chunks = [];
  let size = 0;
  for await (const chunk of req) {
    size += chunk.length;
    if (size > MAX_BODY) break; // the handler answers 413 from content-length
    chunks.push(chunk);
  }
  const headers = new Headers();
  for (const [k, v] of Object.entries(req.headers)) if (typeof v === "string") headers.set(k, v);
  const method = req.method ?? "GET";
  const request = new Request(url, {
    method,
    headers,
    body: method === "GET" || method === "OPTIONS" ? undefined : Buffer.concat(chunks),
  });
  const handler = handlers[method] ?? POST;
  const response = await handler(request);
  res.statusCode = response.status;
  response.headers.forEach((v, k) => res.setHeader(k, v));
  res.end(Buffer.from(await response.arrayBuffer()));
}
