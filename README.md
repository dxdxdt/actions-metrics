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
Updated: 2026-10-14T22:55:09.902309+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.895 |  |
| ap-east-1 | 0.806 |  |
| ap-east-2 | 0.735 |  |
| ap-northeast-1 | 0.613 |  |
| ap-northeast-2 | 0.717 |  |
| ap-northeast-3 | 0.645 |  |
| ap-south-1 | 0.834 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.876 |  |
| ap-southeast-2 | 0.758 |  |
| ap-southeast-3 | 0.928 |  |
| ap-southeast-4 | 0.814 |  |
| ap-southeast-5 | 0.895 |  |
| ap-southeast-6 | 0.823 |  |
| ap-southeast-7 | 0.980 |  |
| ca-central-1 | 0.108 | 18 |
| ca-west-1 | 0.302 |  |
| eu-central-1 | 0.403 |  |
| eu-central-2 | 0.422 |  |
| eu-north-1 | 0.458 |  |
| eu-south-1 | 0.426 |  |
| eu-south-2 | 0.403 |  |
| eu-west-1 | 0.329 |  |
| eu-west-2 | 0.366 |  |
| eu-west-3 | 0.381 |  |
| il-central-1 | 0.566 |  |
| me-central-1 | 0.772 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.497 |  |
| us-east-1 | 0.064 | 5148 |
| us-east-2 | 0.080 | 1699 |
| us-gov-east-1 | 0.102 | 1940 |
| us-gov-west-1 | 0.294 | 237 |
| us-west-1 | 0.229 | 4169 |
| us-west-2 | 0.295 | 194 |

