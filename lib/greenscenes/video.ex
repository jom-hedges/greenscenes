defmodule Greenscenes.Video do
  @bucket
  @region

  def signed_url(path) do
    ExAws.Config.new(:s3, region: @region)
    |> ExAws.S3.presigned_url(:get, @bucket, path, expires_in: 3600)
  end
end
