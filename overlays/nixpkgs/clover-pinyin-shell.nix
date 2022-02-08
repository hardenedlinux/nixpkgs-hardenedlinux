final: prev:
let
  pythonDeps = final.machlib.mkPython rec {
    requirements = ''
    OpenCC
    jieba
    pypinyin
    requests
    '';
  };

in
{
  # https://github.com/fkxxyz/rime-cloverpinyin
  clover-pinyin-shell = prev.mkShell rec {
    buildInputs = [ pythonDeps prev.librime ];
  };
}
