import * as gulp from "gulp";
import { Service, project } from "@wasm/studio-utils";
import { Language } from "@wasm/studio-utils/dist/service";
import { FileType } from "@wasm/studio-utils/dist/model";

gulp.task("build", async () => {
  const data = await Service.compileFile(
    project.getFile("src/main.c"),
    Language.C,
    Language.Wasm,
    "-g -O3"
  );
  const outWasm = project.newFile("out/main.wasm", FileType.Wasm, true);
  outWasm.setData(data);
});

gulp.task("default", ["build"], async () => {});
