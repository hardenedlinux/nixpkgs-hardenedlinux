final: prev:
{
  # https://github.com/fkxxyz/rime-cloverpinyin
  clover-pinyin-shell = final.machlib.mkPythonShell rec {
    requirements = ''
    OpenCC
    jieba
    pypinyin
    requests
    '';
  };
}
