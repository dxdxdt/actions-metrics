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
Updated: 2026-08-14T15:43:21.521413+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.923 |  |
| ap-east-1 | 0.762 |  |
| ap-east-2 | 0.699 |  |
| ap-northeast-1 | 0.583 |  |
| ap-northeast-2 | 0.689 |  |
| ap-northeast-3 | 0.618 |  |
| ap-south-1 | 0.855 |  |
| ap-south-2 | 0.943 |  |
| ap-southeast-1 | 0.847 |  |
| ap-southeast-2 | 0.750 |  |
| ap-southeast-3 | 0.893 |  |
| ap-southeast-4 | 0.784 |  |
| ap-southeast-5 | 0.857 |  |
| ap-southeast-6 | 0.771 |  |
| ap-southeast-7 | 0.942 |  |
| ca-central-1 | 0.140 | 18 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.434 |  |
| eu-central-2 | 0.457 |  |
| eu-north-1 | 0.485 |  |
| eu-south-1 | 0.467 |  |
| eu-south-2 | 0.480 |  |
| eu-west-1 | 0.367 |  |
| eu-west-2 | 0.399 |  |
| eu-west-3 | 0.423 |  |
| il-central-1 | 0.599 |  |
| me-central-1 | 0.837 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.537 |  |
| us-east-1 | 0.096 | 4993 |
| us-east-2 | 0.119 | 1679 |
| us-gov-east-1 | 0.099 | 1827 |
| us-gov-west-1 | 0.264 | 222 |
| us-west-1 | 0.210 | 3946 |
| us-west-2 | 0.263 | 177 |

