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
Updated: 2025-08-23T11:09:39.527526+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.934 |  |
| ap-east-1 | 0.795 |  |
| ap-northeast-1 | 0.591 |  |
| ap-northeast-2 | 0.696 |  |
| ap-south-1 | 0.867 |  |
| ap-southeast-1 | 0.849 |  |
| ap-southeast-2 | 0.738 |  |
| ca-central-1 | 0.161 | 11 |
| eu-central-1 | 0.462 |  |
| eu-north-1 | 0.491 |  |
| eu-south-1 | 0.475 |  |
| eu-west-1 | 0.368 |  |
| eu-west-2 | 0.402 |  |
| eu-west-3 | 0.426 |  |
| me-south-1 | 0.821 |  |
| sa-east-1 | 0.549 |  |
| us-east-1 | 0.105 | 2850 |
| us-east-2 | 0.108 | 751 |
| us-gov-east-1 | 0.127 | 880 |
| us-gov-west-1 | 0.261 | 2 |
| us-west-1 | 0.229 | 1896 |
| us-west-2 | 0.263 |  |

