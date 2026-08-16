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
Updated: 2026-08-16T19:15:32.570811+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.002 |  |
| ap-east-1 | 0.683 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.503 |  |
| ap-northeast-2 | 0.607 |  |
| ap-northeast-3 | 0.527 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.768 |  |
| ap-southeast-2 | 0.663 |  |
| ap-southeast-3 | 0.811 |  |
| ap-southeast-4 | 0.702 |  |
| ap-southeast-5 | 0.786 |  |
| ap-southeast-6 | 0.699 |  |
| ap-southeast-7 | 0.867 |  |
| ca-central-1 | 0.247 | 18 |
| ca-west-1 | 0.229 |  |
| eu-central-1 | 0.518 |  |
| eu-central-2 | 0.542 |  |
| eu-north-1 | 0.565 |  |
| eu-south-1 | 0.537 |  |
| eu-south-2 | 0.539 |  |
| eu-west-1 | 0.429 |  |
| eu-west-2 | 0.474 |  |
| eu-west-3 | 0.487 |  |
| il-central-1 | 0.668 |  |
| me-central-1 | 0.912 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.622 |  |
| us-east-1 | 0.173 | 5009 |
| us-east-2 | 0.201 | 1679 |
| us-gov-east-1 | 0.179 | 1834 |
| us-gov-west-1 | 0.190 | 224 |
| us-west-1 | 0.130 | 3968 |
| us-west-2 | 0.190 | 180 |

