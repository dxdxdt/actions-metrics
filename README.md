# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2025-12-27T23:13:20.168085+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.889 |  |
| ap-east-1 | 0.810 |  |
| ap-northeast-1 | 0.625 |  |
| ap-northeast-2 | 0.736 |  |
| ap-south-1 | 0.812 |  |
| ap-southeast-1 | 0.880 |  |
| ap-southeast-2 | 0.771 |  |
| ca-central-1 | 0.129 | 15 |
| eu-central-1 | 0.399 |  |
| eu-north-1 | 0.454 |  |
| eu-south-1 | 0.427 |  |
| eu-west-1 | 0.323 |  |
| eu-west-2 | 0.361 |  |
| eu-west-3 | 0.377 |  |
| me-south-1 | 0.722 |  |
| sa-east-1 | 0.516 |  |
| us-east-1 | 0.076 | 3809 |
| us-east-2 | 0.106 | 1190 |
| us-gov-east-1 | 0.106 | 1305 |
| us-gov-west-1 | 0.286 | 102 |
| us-west-1 | 0.237 | 2731 |
| us-west-2 | 0.286 | 83 |

