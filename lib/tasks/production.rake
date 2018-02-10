namespace :production do
  SERVER_DISTDIR = './production/app/glink/'.freeze
  CLIENT_DISTDIR = './production/app/glink/public/js/'.freeze

  # 製品版環境をリリースする
  desc 'Release all production modules'
  task all: %i[build_client export] do
    puts '--- release all production modules finished ---'
  end

  # 製品版クライアントアプリをビルドする
  desc 'Build client app with "npm run build"'
  task :build_client do
    puts '--- build_client start ---'
    Dir.chdir('./client') do
      `npm run release`
      unless $CHILD_STATUS.exitstatus.zero?
        puts 'Failed at npm run release'
        next
      end
    end
    puts '--- build_client finished ---'
  end

  # production 配下に製品版実行環境一式をエクスポートする
  desc 'Export all production modules'
  task export: %i[export_server export_client] do
    puts '--- export finished ---'
  end

  # production 配下に製品版サーバ環境をエクスポートする
  directory SERVER_DISTDIR
  desc 'Export server modules to production'
  task export_server: [:clean_server, SERVER_DISTDIR] do
    puts '--- export_server ---'
    src_path = './'
    exclude_dirs = ['.', '..', '.DS_Store', '.bundle', '.git', '.gitignore', \
                    'client', 'log', 'memo', 'production', 'test', 'tmp', 'vendor']
    Dir.entries(src_path).each do |f|
      next if exclude_dirs.include?(f)
      src = src_path + f
      puts "src = #{src}"
      FileUtils.cp_r src, SERVER_DISTDIR
    end
    puts '--- export_server finished ---'
  end

  # production 配下に製品版クライアント環境をエクスポートする
  directory CLIENT_DISTDIR
  desc 'Export client modules to production'
  task export_client: [:clean_client, CLIENT_DISTDIR] do
    puts '--- export_client ---'
    src_path = './client/dist/build.js'
    puts "src_path = #{src_path}"
    FileUtils.cp_r src_path, CLIENT_DISTDIR

    puts '--- export_client finished ---'
  end

  # production 配下の製品版モジュールを全部消去する
  desc 'Clean all exportd files'
  task clean: %i[clean_client clean_server] do
    puts '--- clean_production finished ---'
  end

  # production 配下の製品版サーバモジュールを全部消去する
  desc 'Clean serer modules under production'
  task :clean_server do
    puts '--- clean_server ---'
    FileUtils.rm_r(SERVER_DISTDIR) if FileTest.exist?(SERVER_DISTDIR)
    puts '--- clean_server finished ---'
  end

  # production 配下の製品版クライアントモジュールを全部消去する
  desc 'Clean client modules under production'
  task :clean_client do
    puts '--- clean_client ---'
    if FileTest.exist?(CLIENT_DISTDIR) || FileTest.symlink?(CLIENT_DISTDIR)
      FileUtils.rm_r(CLIENT_DISTDIR)
    end
    puts '--- clean_client finished ---'
  end
end
