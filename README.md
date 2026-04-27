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
Updated: 2026-04-27T21:49:32.854126+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.911 |  |
| ap-east-1 | 0.784 |  |
| ap-east-2 | 0.713 |  |
| ap-northeast-1 | 0.608 |  |
| ap-northeast-2 | 0.704 |  |
| ap-northeast-3 | 0.627 |  |
| ap-south-1 | 0.844 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.861 |  |
| ap-southeast-2 | 0.785 |  |
| ap-southeast-3 | 0.925 |  |
| ap-southeast-4 | 0.820 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.828 |  |
| ap-southeast-7 | 0.966 |  |
| ca-central-1 | 0.112 | 16 |
| ca-west-1 | 0.252 |  |
| eu-central-1 | 0.434 |  |
| eu-central-2 | 0.435 |  |
| eu-north-1 | 0.471 |  |
| eu-south-1 | 0.441 |  |
| eu-south-2 | 0.456 |  |
| eu-west-1 | 0.341 |  |
| eu-west-2 | 0.377 |  |
| eu-west-3 | 0.404 |  |
| il-central-1 | 0.573 |  |
| me-central-1 | 0.806 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.526 |  |
| us-east-1 | 0.076 | 4572 |
| us-east-2 | 0.081 | 1541 |
| us-gov-east-1 | 0.086 | 1666 |
| us-gov-west-1 | 0.291 | 194 |
| us-west-1 | 0.232 | 3490 |
| us-west-2 | 0.288 | 157 |

