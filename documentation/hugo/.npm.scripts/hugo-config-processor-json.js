const jsYamlParser = require('js-yaml');
var yamlParser = require('yaml');
var concat = require('concat-stream');
var fs = require('fs');


const HUGO_PRJ_JSON_CONFIG_PATH = process.env.HUGO_PRJ_JSON_CONFIG_PATH || './config.json.dummy.path.yml'
const HUGO_BASE_URL = process.env.HUGO_BASE_URL || 'https://pokus.example.com'
const HUGO_THEME_NAME = process.env.HUGO_THEME_NAME || 'pokus_dummy_hugo_theme_name'

console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// -------- // ---   CHECK ENV. VARS. `)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// ---   value of HUGO_PRJ_JSON_CONFIG_PATH = [${HUGO_PRJ_JSON_CONFIG_PATH}]`)
console.log(`// ---   value of HUGO_BASE_URL = [${HUGO_BASE_URL}]`)
console.log(`// ---   value of HUGO_THEME_NAME = [${HUGO_THEME_NAME}]`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)


try {
  if (fs.existsSync(`${HUGO_PRJ_JSON_CONFIG_PATH}`)) {
    // HUGO_PRJ_JSON_CONFIG_PATH file MUST exist
  }
} catch(err) {
  console.error(`Pokus - HUGO_PRJ_JSON_CONFIG_PATH=[${HUGO_PRJ_JSON_CONFIG_PATH}] file MUST exist, but it does not`);
  console.error(err)
  throw err;
}

const RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH = process.env.HUGO_PRJ_JSON_CONFIG_PATH;


console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// -------- // ---   CHECK COMPUTED VALUES `)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// ---   value of RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH = [${RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH}]`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)

// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //
// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //
// ---   1./ I first read the file to load YAML data
// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //
// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //

console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// ---   1./ I first read the file to load YAML data`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
// Error: Function yaml.safeLoad is removed in js-yaml 4. Use yaml.load instead, which is now safe by default.
let RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH_AS_JSON_OBJ = jsYamlParser.load(fs.readFileSync(RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH, 'utf8'));





if (!fs.existsSync(RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH)) {
  throw new Error("{[Pokus]} - [" + `${RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH}` + "] file MUST exist, but it does not");
} else {
  console.log("{[Pokus]} - found [config.json] hugo project config file located at [" + RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH + "]");
}
// console.info("{[Pokus]} - Parsing release.json Release Manifest file located at [" + RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH + "]");
// console.debug("{[Pokus]} - Parsed Manifest is [" + `${JSON.stringify(this.releaseManifest, null, "  ")}` + "]");
let RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH_AS_STRING: string = fs.readFileSync(`${RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH}`,'utf8');
let RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH_AS_JSON_OBJ = JSON.parse(RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH_AS_STRING);





// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //
// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //
// ---   2./ I Then in-memory edit the loaded YAML data
// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //
// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //


console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// ---   2./ I Then in-memory edit the loaded YAML data`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// --- RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH_AS_JSON_OBJ [BEFORE] ANY MODIFICATION :  `)
console.log(`${JSON.stringify(RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH_AS_JSON_OBJ, " ", 4)}`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)


/*
  sed -i "s#baseURL =.*#baseURL = \"${HUGO_BASE_URL}\"#g" ./config.toml
  sed -i "s#theme =.*#theme = \"${HUGO_THEME_NAME}\"#g" ./config.toml

  # cat <<EOF > ./addon.config.toml
  # # --- # ---  # ---
  # # --- # ---  # ---
  # # Pokus.io Addon
  # # --- # ---  # ---
  # #
  # [${HUGO_THEME_NAME}.custom_theme_options]
  # targetPath = "assets/custom-theme.css"
  # enableSourceMap = true
  #
  # # --- # ---  # ---
  # # Addon to use Bulma as integrated SCSS Processor
  # [[module.imports]]
  #   path = "github.com/jgthms/bulma"
  #   disable = false
  #   # [[module.imports.mounts]]
  #     # source = "."
  #     # target = "assets/sass"
  #   [[module.imports.mounts]]
  #     source = "."
  #     target = "assets/bulma"
  # EOF

  # ----
  # Same as Above TOML, converted to Yaml :
  cat <<EOF > ./addon.config.yaml
  # --- # ---  # ---
  # --- # ---  # ---
  # Pokus.io Addon
  # --- # ---  # ---
  #
  ${HUGO_THEME_NAME}:
    custom_theme_options:
      targetPath: assets/custom-theme.css
      enableSourceMap: true
  # --- # ---  # ---
  # Addon to use Bulma as integrated SCSS Processor
  module:
    imports:
      - path: github.com/jgthms/bulma
        disable: false
        mounts:
          - source: .
            target: assets/bulma
  EOF




  echo '' | tee -a ./config.toml
  echo '' | tee -a ./config.toml
  cat ./addon.config.toml | tee -a ./config.toml
  rm ./addon.config.toml


  echo "# ----------- AVANT SED [./config.toml]"
  echo "DEBUG : ./config.toml"
  ls -alh ./config.toml
  echo "DEBUG : ./config.toml | grep themesdir"
  cat ./config.toml | grep themesdir
  sed -i "s#themesDir.*=.*#themesDir = \"./themes\"#g" ./config.toml
  sed -i "s#themesdir.*=.*#themesdir = \"./themes\"#g" ./config.toml
*/





/// RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH_AS_JSON_OBJ.General.Greeting = 'newGreet';
/// RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH_AS_JSON_OBJ.baseURL = " [hugo project Title] - autre - blabla nimpoorte koi jbl"
RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH_AS_JSON_OBJ.baseURL = `${HUGO_BASE_URL}`

/// RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH_AS_JSON_OBJ.themesDir = " [themesDir] - autre - blabla nimpoorte koi jbl"

RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH_AS_JSON_OBJ.themesDir = "./themes"
RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH_AS_JSON_OBJ.themesdir = "./themes"

//myObject['first name'] = 'John'; // property name with a space



RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH_AS_JSON_OBJ[`${HUGO_THEME_NAME}`] = {}
RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH_AS_JSON_OBJ[`${HUGO_THEME_NAME}`].custom_theme_options = {
  targetPath: `assets/bulma`,
  enableSourceMap: true
}

RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH_AS_JSON_OBJ.module = {}
RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH_AS_JSON_OBJ.module.imports = [
  {
    path: "github.com/jgthms/bulma",
    disable: false,
    mounts: [
      {
        source: ".",
        target: "assets/bulma"
      }
    ]
  }
]



console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// --- RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH_AS_JSON_OBJ [AFTER AFTER] ALL MODIFICATIONS :  `)
console.log(`${JSON.stringify(RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH_AS_JSON_OBJ, " ", 4)}`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)


// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //
// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //
// ---   3./ And i finally write the data back to the configuration file
// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //
// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// ---   3./ And i finally write the data back to the configuration file`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
// let cheminFichierGenere = './ConnerieSettings.yml';
let cheminFichierGenere =  `${RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH}`
// Error: Function yaml.safeDump is removed in js-yaml 4. Use yaml.dump instead, which is now safe by default.
try {
  fs.writeFileSync(`${manifestPath}`, `${JSON.stringify(this.releaseManifest, null, 4)}`, {}); // no options
  console.log('{[ReleaseProcessStatePersistenceManager]} - [prepareNextVersion(): void] - Successfully wrote to ' + `[${manifestPath}] to prepare next patch version on [${nextSupportBranch}] new support branch.`);
} catch(err) {
  // An error occurred // former persistSuccessStateOf
  console.log('{[ReleaseProcessStatePersistenceManager]} - [prepareNextVersion(): void] - An Error occurred writing to ' + `[${manifestPath}] to prepare next patch version on [${nextSupportBranch}] new support branch  `);
  console.error(err);
  throw err;
}

fs.writeFile(cheminFichierGenere, JSON.stringify(RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH_AS_JSON_OBJ, null, 4), (err) => {
    if (err) {
        console.error(`Il y a eut une erreur au moment d'écrire dans le fichier Yaml généré`);
        console.log(err);
    } else {
      console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
      console.log(`// -------- Successfully generated the [${RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH}] Hugo Prject Vonfiguration File  `)
      console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)
    }
});


/*

fs.createReadStream(RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH, 'utf8').pipe(concat(function(data) {

  console.log(`// ------- // ------- // -------  // -------  // -------  // ------- //`)
  console.log(`// ------- // ------- // -------  // -------  // -------  // ------- //`)
  console.log(`[fs.createReadStream] - Yaml data before any parsing : `);
  console.log(`// ------- // ------- // -------  // -------  // -------  // ------- //`)
  console.log(data)
  console.log(`// ------- // ------- // -------  // -------  // -------  // ------- //`)

  var parsedYamlDoc = yamlParser.parse(data);

  console.log(`// ------- // ------- // -------  // -------  // -------  // ------- //`)
  console.log(`// ------- // ------- // -------  // -------  // -------  // ------- //`)
  console.log(`[fs.createReadStream] - parsed Yaml before any change : `);
  console.log(`// ------- // ------- // -------  // -------  // -------  // ------- //`)
  console.log(parsedYamlDoc);
  console.log(`// ------- // ------- // -------  // -------  // -------  // ------- //`)
  console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)

  parsedYamlDoc.title = " [hugo project Title] blabla nimpoorte koi jbl"
  parsedYamlDoc.themesDir = " [themesDir] blabla nimpoorte koi jbl"


  console.log(`// ------- // ------- // -------  // -------  // -------  // ------- //`)
  console.log(`// ------- // ------- // -------  // -------  // -------  // ------- //`)
  console.log(`[fs.createReadStream] - parsed Yaml AFTER changes : `);
  console.log(`// ------- // ------- // -------  // -------  // -------  // ------- //`)
  console.log(parsedYamlDoc);
  console.log(`// ------- // ------- // -------  // -------  // -------  // ------- //`)
  console.log(`// -------- // -------- // -------- // -------- // -------- // -------- // -------- // -------- //`)


  try {
    fs.writeFileSync(`${RESOLVED_HUGO_PRJ_JSON_CONFIG_PATH}`, parsedYamlDoc); // no options
  } catch(err) {
    console.error(err);
    // throw err;
  }

}));


*/
