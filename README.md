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
Updated: 2026-02-14T11:17:21.565916+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.037 |  |
| ap-east-1 | 0.656 |  |
| ap-east-2 | 0.594 |  |
| ap-northeast-1 | 0.478 |  |
| ap-northeast-2 | 0.582 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.740 |  |
| ap-southeast-2 | 0.632 |  |
| ap-southeast-3 | 0.792 |  |
| ap-southeast-4 | 0.673 |  |
| ap-southeast-5 | 0.760 |  |
| ap-southeast-6 | 0.682 |  |
| ap-southeast-7 | 0.843 |  |
| ca-central-1 | 0.258 | 16 |
| ca-west-1 | 0.201 |  |
| eu-central-1 | 0.538 |  |
| eu-central-2 | 0.553 |  |
| eu-north-1 | 0.588 |  |
| eu-south-1 | 0.579 |  |
| eu-south-2 | 0.571 |  |
| eu-west-1 | 0.468 |  |
| eu-west-2 | 0.504 |  |
| eu-west-3 | 0.520 |  |
| il-central-1 | 0.737 |  |
| me-central-1 | 0.940 |  |
| me-south-1 | 0.881 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.653 |  |
| us-east-1 | 0.206 | 4120 |
| us-east-2 | 0.195 | 1339 |
| us-gov-east-1 | 0.192 | 1462 |
| us-gov-west-1 | 0.154 | 147 |
| us-west-1 | 0.111 | 3059 |
| us-west-2 | 0.158 | 125 |

