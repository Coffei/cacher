defmodule CacherWeb.CacheView do
  use CacherWeb, :view
  alias Cacher.Caches.Cache

  def cache_types do
    [[key: "", value: "", label: ""] |
     for {name, key} <- Cache.cache_type_options() do
       [key: name, value: key, label: name]
     end
    ]
  end

  def type(cache) do
    Cache.cache_types()[cache.type] || Cache.cache_types()["unknown"]
  end
end
