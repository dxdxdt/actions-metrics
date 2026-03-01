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
Updated: 2026-03-01T17:16:57.933999+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.052 |  |
| ap-east-1 | 0.656 |  |
| ap-east-2 | 0.598 |  |
| ap-northeast-1 | 0.478 |  |
| ap-northeast-2 | 0.586 |  |
| ap-northeast-3 | 0.501 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.736 |  |
| ap-southeast-2 | 0.619 |  |
| ap-southeast-3 | 0.792 |  |
| ap-southeast-4 | 0.660 |  |
| ap-southeast-5 | 0.753 |  |
| ap-southeast-6 | 0.666 |  |
| ap-southeast-7 | 0.834 |  |
| ca-central-1 | 0.290 | 16 |
| ca-west-1 | 0.199 |  |
| eu-central-1 | 0.554 |  |
| eu-central-2 | 0.579 |  |
| eu-north-1 | 0.621 |  |
| eu-south-1 | 0.590 |  |
| eu-south-2 | 0.590 |  |
| eu-west-1 | 0.490 |  |
| eu-west-2 | 0.519 |  |
| eu-west-3 | 0.531 |  |
| il-central-1 | 0.754 |  |
| me-central-1 | 0.932 |  |
| me-south-1 | 0.894 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.669 |  |
| us-east-1 | 0.224 | 4207 |
| us-east-2 | 0.209 | 1387 |
| us-gov-east-1 | 0.205 | 1519 |
| us-gov-west-1 | 0.150 | 167 |
| us-west-1 | 0.098 | 3149 |
| us-west-2 | 0.150 | 135 |

