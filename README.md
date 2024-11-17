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
Updated: 2024-11-17T09:12:09.318562

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.881 |  |
| ap-east-1 | 0.871 |  |
| ap-northeast-1 | 0.673 |  |
| ap-northeast-2 | 0.784 |  |
| ap-south-1 | 0.849 |  |
| ap-southeast-1 | 0.935 |  |
| ap-southeast-2 | 0.813 |  |
| ca-central-1 | 0.130 |  |
| eu-central-1 | 0.414 |  |
| eu-north-1 | 0.464 |  |
| eu-south-1 | 0.432 |  |
| eu-west-1 | 0.325 |  |
| eu-west-2 | 0.367 |  |
| eu-west-3 | 0.381 |  |
| me-south-1 | 0.756 |  |
| sa-east-1 | 0.506 |  |
| us-east-1 | 0.065 | 46 |
| us-east-2 | 0.140 | 11 |
| us-gov-east-1 | 0.134 | 3 |
| us-gov-west-1 | 0.362 |  |
| us-west-1 | 0.294 | 21 |
| us-west-2 | 0.359 |  |

