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
Updated: 2026-08-17T14:20:13.370709+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.064 |  |
| ap-east-1 | 0.641 |  |
| ap-east-2 | 0.580 |  |
| ap-northeast-1 | 0.464 |  |
| ap-northeast-2 | 0.572 |  |
| ap-northeast-3 | 0.490 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.716 |  |
| ap-southeast-2 | 0.597 |  |
| ap-southeast-3 | 0.774 |  |
| ap-southeast-4 | 0.638 |  |
| ap-southeast-5 | 0.734 |  |
| ap-southeast-6 | 0.633 |  |
| ap-southeast-7 | 0.816 |  |
| ca-central-1 | 0.291 | 18 |
| ca-west-1 | 0.223 |  |
| eu-central-1 | 0.581 |  |
| eu-central-2 | 0.593 |  |
| eu-north-1 | 0.604 |  |
| eu-south-1 | 0.600 |  |
| eu-south-2 | 0.610 |  |
| eu-west-1 | 0.498 |  |
| eu-west-2 | 0.536 |  |
| eu-west-3 | 0.549 |  |
| il-central-1 | 0.736 |  |
| me-central-1 | 0.947 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.691 |  |
| us-east-1 | 0.240 | 5011 |
| us-east-2 | 0.243 | 1680 |
| us-gov-east-1 | 0.212 | 1839 |
| us-gov-west-1 | 0.123 | 224 |
| us-west-1 | 0.066 | 3977 |
| us-west-2 | 0.123 | 181 |

