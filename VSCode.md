```bash
EXTENSIONS=(
  piousdeer.adwaita-theme
  formulahendry.auto-rename-tag
  streetsidesoftware.code-spell-checker
  editorconfig.editorconfig
  dbaeumer.vscode-eslint
  pkief.material-icon-theme
  christian-kohler.path-intellisense
  yoavbls.pretty-ts-errors
  alefragnani.project-manager
  streetsidesoftware.code-spell-checker-russian
  stylelint.vscode-stylelint
  sysoev.language-stylus
  mblode.twig-language
  vue.volar
  redhat.vscode-yaml
)
for EXTENSION in ${EXTENSIONS[@]}; do
  code --install-extension $EXTENSION
done
```