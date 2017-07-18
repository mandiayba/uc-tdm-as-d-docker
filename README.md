# uc-tdm-AS-D-docker

Docker for the OpenMinTeD AS-D use case

To run the AS-D workflow with a local corpus :

```sudo docker run -i --rm -v /path/to/local/corpus:/path/on/the/container1 /path/to/where/you/want/the/output:/path/on/the/container2 ldeleger/uc-tdm-as-d-docker alvisnlp -J "-Xmx30g" -entity inputfile /path/on/the/container1/inputfilename -entity outdir /path/on/the/container2 plans/tag_WoS_abstracts.plan```



