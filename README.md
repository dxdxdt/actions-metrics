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
Updated: 2026-07-11T20:00:57.008257+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.049 |  |
| ap-east-1 | 0.638 |  |
| ap-east-2 | 0.575 |  |
| ap-northeast-1 | 0.459 |  |
| ap-northeast-2 | 0.565 |  |
| ap-northeast-3 | 0.486 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.712 |  |
| ap-southeast-2 | 0.592 |  |
| ap-southeast-3 | 0.770 |  |
| ap-southeast-4 | 0.637 |  |
| ap-southeast-5 | 0.737 |  |
| ap-southeast-6 | 0.629 |  |
| ap-southeast-7 | 0.816 |  |
| ca-central-1 | 0.306 | 16 |
| ca-west-1 | 0.188 |  |
| eu-central-1 | 0.573 |  |
| eu-central-2 | 0.597 |  |
| eu-north-1 | 0.625 |  |
| eu-south-1 | 0.617 |  |
| eu-south-2 | 0.603 |  |
| eu-west-1 | 0.502 |  |
| eu-west-2 | 0.537 |  |
| eu-west-3 | 0.555 |  |
| il-central-1 | 0.738 |  |
| me-central-1 | 0.945 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.693 |  |
| us-east-1 | 0.243 | 4850 |
| us-east-2 | 0.244 | 1656 |
| us-gov-east-1 | 0.224 | 1738 |
| us-gov-west-1 | 0.125 | 202 |
| us-west-1 | 0.065 | 3768 |
| us-west-2 | 0.122 | 165 |

