# uc-tdm-AS-D-docker

Docker for the OpenMinTeD AS-D use case

To run the AS-D workflow with a local corpus :

```sudo docker run -i --rm -v $PWD/test-data/:/as-d/data ldeleger/uc-tdm-as-d-docker alvisnlp -J "-Xmx30g" -entity inputfile /as-d/data/corpus/test.txt -entity outdir /as-d/data/output plans/tag_WoS_abstracts.plan```



