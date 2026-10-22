# CV

## Local

Requires [Nix](https://nixos.org) with flakes enabled.

```console
$ nix develop
$ npm install
$ npm run dev                   # rebuild dist/output.css on change
$ python -m http.server 8080    # in another shell, then open http://localhost:8080
```

Run `npm run build` to regenerate `dist/output.css` once before committing.
Tailwind v4 is configured in `input.css` (`@source`, `@theme`).

## Github Pages

Just push.
