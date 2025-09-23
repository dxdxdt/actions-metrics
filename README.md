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
Updated: 2025-09-23T06:19:31.521079+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.038 |  |
| ap-east-1 | 0.697 |  |
| ap-northeast-1 | 0.499 |  |
| ap-northeast-2 | 0.607 |  |
| ap-south-1 | 0.926 |  |
| ap-southeast-1 | 0.757 |  |
| ap-southeast-2 | 0.647 |  |
| ca-central-1 | 0.254 | 15 |
| eu-central-1 | 0.541 |  |
| eu-north-1 | 0.587 |  |
| eu-south-1 | 0.555 |  |
| eu-west-1 | 0.451 |  |
| eu-west-2 | 0.495 |  |
| eu-west-3 | 0.517 |  |
| me-south-1 | 0.843 |  |
| sa-east-1 | 0.654 |  |
| us-east-1 | 0.217 | 3142 |
| us-east-2 | 0.205 | 804 |
| us-gov-east-1 | 0.183 | 999 |
| us-gov-west-1 | 0.159 | 32 |
| us-west-1 | 0.126 | 2084 |
| us-west-2 | 0.163 | 15 |

