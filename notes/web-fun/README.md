Exploring Charles O'Farrell's Lambda Jam talk [Caught in a web of functions](http://blog.charleso.org/lambdajam-web-functions/#1).

## Routing libraries

Would be nice to have something better than "raw routing". Explore these
libraries:

* [web-routes](https://hackage.haskell.org/package/web-routes)
* [web-routes-boomerang](https://hackage.haskell.org/package/web-routes-boomerang)
* [wai-routing](https://hackage.haskell.org/package/wai-routing)
* [wai-routes](https://hackage.haskell.org/package/wai-routes)
* [waitra](https://hackage.haskell.org/package/waitra)
* [snap-web-routes](https://hackage.haskell.org/package/snap-web-routes)
* [reroute](https://hackage.haskell.org/package/reroute)

Some of these will lead to inefficiencies. Nice to have:

- Type safe routes.
- Checking for overlapping routes (aka route patterns).
- Efficiency (similar to "raw routes" i.e. a pattern-matching compiler).
