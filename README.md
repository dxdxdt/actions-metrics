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
Updated: 2026-03-03T04:08:11.685656+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.981 |  |
| ap-east-1 | 0.721 |  |
| ap-east-2 | 0.655 |  |
| ap-northeast-1 | 0.536 |  |
| ap-northeast-2 | 0.637 |  |
| ap-northeast-3 | 0.560 |  |
| ap-south-1 | 0.925 |  |
| ap-south-2 | 0.958 |  |
| ap-southeast-1 | 0.790 |  |
| ap-southeast-2 | 0.702 |  |
| ap-southeast-3 | 0.842 |  |
| ap-southeast-4 | 0.744 |  |
| ap-southeast-5 | 0.811 |  |
| ap-southeast-6 | 0.765 |  |
| ap-southeast-7 | 0.891 |  |
| ca-central-1 | 0.162 | 16 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.490 |  |
| eu-central-2 | 0.500 |  |
| eu-north-1 | 0.540 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.527 |  |
| eu-west-1 | 0.405 |  |
| eu-west-2 | 0.450 |  |
| eu-west-3 | 0.475 |  |
| il-central-1 | 0.670 |  |
| me-central-1 | 0.852 |  |
| me-south-1 | 0.818 |  |
| mx-central-1 | 0.209 |  |
| sa-east-1 | 0.597 |  |
| us-east-1 | 0.133 | 4211 |
| us-east-2 | 0.111 | 1392 |
| us-gov-east-1 | 0.111 | 1524 |
| us-gov-west-1 | 0.191 | 169 |
| us-west-1 | 0.202 | 3161 |
| us-west-2 | 0.190 | 136 |

