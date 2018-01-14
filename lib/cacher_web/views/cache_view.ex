defmodule CacherWeb.CacheView do
  use CacherWeb, :view
  alias Cacher.Caches.Cache

  def cache_types do
    [[key: "", value: "", label: ""] |
     for {name, key} <- Cache.cache_types() do
       [key: name, value: key, label: name]
     end
    ]
  end
end
