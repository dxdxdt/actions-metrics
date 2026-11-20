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
Updated: 2026-11-20T22:53:17.491582+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.696 |  |
| ap-east-1 | 0.552 |  |
| ap-east-2 | 0.507 |  |
| ap-northeast-1 | 0.419 |  |
| ap-northeast-2 | 0.497 |  |
| ap-northeast-3 | 0.438 |  |
| ap-south-1 | 0.664 |  |
| ap-south-2 | 0.720 |  |
| ap-southeast-1 | 0.611 |  |
| ap-southeast-2 | 0.542 |  |
| ap-southeast-3 | 0.656 |  |
| ap-southeast-4 | 0.603 |  |
| ap-southeast-5 | 0.625 |  |
| ap-southeast-6 | 0.556 |  |
| ap-southeast-7 | 0.686 |  |
| ca-central-1 | 0.107 | 18 |
| ca-west-1 | 0.181 |  |
| eu-central-1 | 0.348 |  |
| eu-central-2 | 0.367 |  |
| eu-north-1 | 0.377 |  |
| eu-south-1 | 0.373 |  |
| eu-south-2 | 0.356 |  |
| eu-west-1 | 0.277 |  |
| eu-west-2 | 0.311 |  |
| eu-west-3 | 0.329 |  |
| il-central-1 | 0.463 |  |
| me-central-1 | 0.614 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.649 |  |
| mx-central-1 | 0.177 |  |
| sa-east-1 | 0.423 |  |
| us-east-1 | 0.083 | 5192 |
| us-east-2 | 0.091 | 1730 |
| us-gov-east-1 | 0.086 | 1964 |
| us-gov-west-1 | 0.175 | 248 |
| us-west-1 | 0.143 | 4220 |
| us-west-2 | 0.175 | 199 |

