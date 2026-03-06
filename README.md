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
Updated: 2026-03-06T19:29:42.265136+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.961 |  |
| ap-east-1 | 0.740 |  |
| ap-east-2 | 0.681 |  |
| ap-northeast-1 | 0.556 |  |
| ap-northeast-2 | 0.657 |  |
| ap-northeast-3 | 0.591 |  |
| ap-south-1 | 0.906 |  |
| ap-south-2 | 0.958 |  |
| ap-southeast-1 | 0.813 |  |
| ap-southeast-2 | 0.724 |  |
| ap-southeast-3 | 0.865 |  |
| ap-southeast-4 | 0.762 |  |
| ap-southeast-5 | 0.833 |  |
| ap-southeast-6 | 0.788 |  |
| ap-southeast-7 | 0.914 |  |
| ca-central-1 | 0.131 | 16 |
| ca-west-1 | 0.204 |  |
| eu-central-1 | 0.472 |  |
| eu-central-2 | 0.483 |  |
| eu-north-1 | 0.518 |  |
| eu-south-1 | 0.487 |  |
| eu-south-2 | 0.502 |  |
| eu-west-1 | 0.393 |  |
| eu-west-2 | 0.421 |  |
| eu-west-3 | 0.455 |  |
| il-central-1 | 0.645 |  |
| me-central-1 | 0.839 |  |
| me-south-1 | 0.812 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.595 |  |
| us-east-1 | 0.113 | 4232 |
| us-east-2 | 0.089 | 1405 |
| us-gov-east-1 | 0.090 | 1532 |
| us-gov-west-1 | 0.213 | 173 |
| us-west-1 | 0.216 | 3185 |
| us-west-2 | 0.212 | 142 |

