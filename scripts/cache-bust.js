// Append a content hash of dist/output.css to its <link> in index.html, so
// browsers fetch the new stylesheet as soon as index.html changes.
import { createHash } from "node:crypto";
import { readFileSync, writeFileSync } from "node:fs";

const css = readFileSync("dist/output.css");
const hash = createHash("sha256").update(css).digest("hex").slice(0, 8);
const html = readFileSync("index.html", "utf8");
const busted = html.replace(/dist\/output\.css(\?v=\w+)?"/, `dist/output.css?v=${hash}"`);

writeFileSync("index.html", busted);
