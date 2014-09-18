require 'spec_helper'

describe 'phantomjs::structure' do
  let(:src_dir) { '/foo/bar/zip' }
  let(:runner) do
    runner = ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04')
    runner.node.set['phantomjs']['src_dir'] = src_dir
    runner.converge('phantomjs::structure')
  end

  it 'creates the source directory' do
    expect(runner).to create_directory(src_dir)
  end

  it 'is owned by the root user' do
    expect(runner.directory(src_dir).owner).to eq('root')
    expect(runner.directory(src_dir).group).to eq('root')
  end

  it 'has 0755 permissions' do
    expect(runner.directory(src_dir).mode).to eq('0755')
  end
end
