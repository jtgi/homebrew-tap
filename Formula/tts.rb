class Tts < Formula
  desc "Text-to-speech CLI using ElevenLabs API"
  homepage "https://github.com/jtgi/tts"
  url "https://github.com/jtgi/tts/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d8e61e40f863dde099c984a46684d8c1bd4d08387aa6b8ddbff3a0bf3572e05f"
  license "MIT"

  def install
    bin.install "tts"
    man1.install "man/tts.1"
    bash_completion.install "completions/tts.bash" => "tts"
    zsh_completion.install "completions/tts.zsh" => "_tts"
  end

  def caveats
    <<~EOS
      To use tts, you need to set your ElevenLabs API key:
        export ELEVENLABS_API_KEY='your-api-key-here'

      Usage:
        echo "Hello world" | tts > hello.mp3
        cat book.txt | tts -v EXAVITQu4vr4xnSDxMaL > book.mp3
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/tts --help", 0)
  end
end