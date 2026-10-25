// Generates the gateway's TypeScript types and schema bundle, and the app's Dart
// classes, from schemas/ (spec §4: the contract cannot drift between them).
import { FetchingJSONSchemaStore, InputData, JSONSchemaInput, quicktype } from "quicktype-core";

const root = new URL("..", import.meta.url);
const schemaDir = new URL("schemas/", root);
const tsOut = new URL(
  "../../backend/supabase/functions/_shared/contracts/",
  root,
);
const dartOut = new URL("dart/lib/src/", root);

const header = "// GENERATED from packages/cloud_contracts/schemas. Do not edit.\n" +
  "// Run `deno task gen` in packages/cloud_contracts.\n";

const files = [...Deno.readDirSync(schemaDir)]
  .map((e) => e.name)
  .filter((n) => n.endsWith(".schema.json"))
  .sort();

const schemas: Record<string, unknown> = {};
for (const f of files) {
  schemas[f] = JSON.parse(Deno.readTextFileSync(new URL(f, schemaDir)));
}

class LocalStore extends FetchingJSONSchemaStore {
  override fetch(address: string) {
    const name = address.split("/").pop()!.split("#")[0];
    return Promise.resolve(schemas[name] as never);
  }
}

async function generate(lang: "typescript" | "dart"): Promise<string> {
  const input = new JSONSchemaInput(new LocalStore());
  for (const f of files) {
    if (f === "common.schema.json") continue;
    const title = (schemas[f] as { title: string }).title;
    await input.addSource({
      name: title,
      uris: [`https://mona.app/contracts/${f}#`],
    });
  }
  const data = new InputData();
  data.addInput(input);
  const options: Record<string, string> = lang === "typescript"
    ? { "just-types": "true", "prefer-unions": "true", "prefer-types": "true" }
    : { "null-safety": "true", "required-props": "true", "final-props": "true" };
  const result = await quicktype({
    inputData: data,
    lang,
    rendererOptions: options,
  });
  return header + "\n" + result.lines.join("\n") + "\n";
}

Deno.mkdirSync(tsOut, { recursive: true });
Deno.mkdirSync(dartOut, { recursive: true });

Deno.writeTextFileSync(new URL("types.ts", tsOut), await generate("typescript"));

const bundle = header + "\n" +
  "// deno-fmt-ignore-file\n" +
  "export const schemas = " + JSON.stringify(schemas, null, 2) + " as const;\n";
Deno.writeTextFileSync(new URL("schemas.ts", tsOut), bundle);

Deno.writeTextFileSync(new URL("contracts.dart", dartOut), await generate("dart"));
console.log(`generated from ${files.length} schemas`);
