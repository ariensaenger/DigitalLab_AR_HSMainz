CREATE TABLE `Type_Headset <recommended>` (
  `type_name` varchar,
  `beschreibung_type` <type>,
  PRIMARY KEY (`type_name`)
);

CREATE TABLE `Ecommerce_Provider <optional> ` (
  `ecommerce_id *` int,
  `ecommerce_name *` varchar,
  `ecommerce_main_url *` <type>,
  `ecommerce_type` <type>,
  PRIMARY KEY (`ecommerce_id *`)
);

CREATE TABLE `Development_Software <mandatory>` (
  `software_id *` int,
  `software_name *` varchar,
  `type_software` <type>,
  `ecommerce_id` integer,
  `preis_average` <type>,
  `technische_features` <type>,
  `version` <type>,
  `meta_id` integer,
  PRIMARY KEY (`software_id *`),
  FOREIGN KEY (`ecommerce_id`) REFERENCES `Ecommerce_Provider <optional> `(`ecommerce_id *`)
);

CREATE TABLE `AR_Headset <mandatory> ` (
  `headset_id *` integer,
  `headset_name *` varchar,
  `headset_provider *` <type>,
  `beschreibung_headset` <type>,
  `type_name ` <type>,
  `release_datum` <type>,
  `ecommerce_id` integer,
  `ecommerce_headset_url` <type>,
  `preis_average` <type>,
  `quelle_id` integer,
  `quelle_composition` <type>,
  `meta_id` integer,
  `aktualität_version_date` <type>,
  `technische_features` <type>,
  `ar_feature_name` <type>,
  `pros` <type>,
  `cons` <type>,
  `relevanz_rating` <type>,
  `b2b_or_b2c` boolean,
  `branche_name *` <type>,
  `software_id` integer,
  `software_name` <type>,
  `artefakt_name` <type>,
  PRIMARY KEY (`headset_id *`),
  FOREIGN KEY (`type_name `) REFERENCES `Type_Headset <recommended>`(`type_name`),
  FOREIGN KEY (`software_id`) REFERENCES `Development_Software <mandatory>`(`software_id *`)
);

CREATE TABLE `Quellen_Verzeichnis <recommended>` (
  `quelle_id` integer,
  `quelle_composition` <type>,
  PRIMARY KEY (`quelle_id`),
  FOREIGN KEY (`quelle_id`) REFERENCES `AR_Headset <mandatory> `(`quelle_id`)
);

CREATE TABLE `Meta_Verzeichnis <optional> ` (
  `meta_id` integer,
  `editor_name` varchar,
  `aktualität_version_date` <type>,
  PRIMARY KEY (`meta_id`)
);

CREATE TABLE `Branche  <mandatory> ` (
  `branche_name*` varchar,
  `referenzunternehmen_id` integer,
  `referenzunternehmen_namen` varchar,
  PRIMARY KEY (`branche_name*`)
);

CREATE TABLE `AR_Feature  <recommended> ` (
  `ar_feature_name*` <type>,
  `ar_feature_tags` <type>,
  `beschreibung_ar_feature` <type>,
  PRIMARY KEY (`ar_feature_name*`),
  FOREIGN KEY (`ar_feature_name*`) REFERENCES `AR_Headset <mandatory> `(`ar_feature_name`)
);

CREATE TABLE `Usecase_Artefakt  <mandatory> ` (
  `artefakt_name *` varchar,
  `beschreibung_artefakt` <type>,
  `usecase_id *` integer,
  `usecase_name *` varchar,
  `ar_feature_name` varchar,
  PRIMARY KEY (`artefakt_name *`)
);

CREATE TABLE `Referenzunternehmen  <optional> ` (
  `referenzunternehmen_id` integer,
  `referenzunternehmen_namen` varchar,
  PRIMARY KEY (`referenzunternehmen_id`),
  FOREIGN KEY (`referenzunternehmen_id`) REFERENCES `Branche  <mandatory> `(`referenzunternehmen_id`)
);

CREATE TABLE `Geschäftsbereich <optional> ` (
  `geschäftsbereich_name` varchar,
  PRIMARY KEY (`geschäftsbereich_name`)
);

CREATE TABLE `Referenzprojekte  <recommended> ` (
  `referenzprojekt_id *` integer,
  `referenzprojekt_name *` varchar,
  `beschreibung_referenzprojekt` <type>,
  `geschäftsbereich_name` varchar,
  `referenzunternehmen_id *` integer,
  `referenzunternehmen_namen` varchar,
  `artefakt_name *` varchar,
  `prozess_id *` integer,
  `prozess_name` varchar,
  PRIMARY KEY (`referenzprojekt_id *`),
  FOREIGN KEY (`referenzunternehmen_id *`) REFERENCES `Referenzunternehmen  <optional> `(`referenzunternehmen_id`),
  FOREIGN KEY (`artefakt_name *`) REFERENCES `Usecase_Artefakt  <mandatory> `(`artefakt_name *`),
  FOREIGN KEY (`geschäftsbereich_name`) REFERENCES `Geschäftsbereich <optional> `(`geschäftsbereich_name`)
);

CREATE TABLE `Unternehmensprozess <mandatory> ` (
  `prozess_id  *` integer,
  `prozess_name` varchar,
  `beschreibung_prozess` <type>,
  `modell_prozess` <type>,
  `geschäftsbereich_name` varchar,
  `bedarf_id` integer,
  PRIMARY KEY (`prozess_id  *`)
);

CREATE TABLE `Usecase  <mandatory> ` (
  `usecase_id *` integer,
  `usecase_name *` varchar,
  `beschreibung_usecase` <type>,
  `geschäftsbereich_name` varchar,
  `process_id *` integer,
  `usecase_name` varchar,
  `branche_name *` varchar,
  PRIMARY KEY (`usecase_id *`),
  FOREIGN KEY (`branche_name *`) REFERENCES `Branche  <mandatory> `(`branche_name*`),
  FOREIGN KEY (`process_id *`) REFERENCES `Unternehmensprozess <mandatory> `(`prozess_id  *`)
);

CREATE TABLE `AR_Bedarfe <optional> ` (
  `bedarf_id *` integer,
  `bedarf_name` varchar,
  `beschreibung_bedarf` <type>,
  `process_id *` integer,
  PRIMARY KEY (`bedarf_id *`),
  FOREIGN KEY (`bedarf_id *`) REFERENCES `Unternehmensprozess <mandatory> `(`bedarf_id`)
);