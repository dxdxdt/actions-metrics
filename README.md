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
Updated: 2026-07-12T05:22:39.717444+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.943 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.684 |  |
| ap-northeast-1 | 0.566 |  |
| ap-northeast-2 | 0.670 |  |
| ap-northeast-3 | 0.592 |  |
| ap-south-1 | 0.894 |  |
| ap-south-2 | 0.935 |  |
| ap-southeast-1 | 0.820 |  |
| ap-southeast-2 | 0.715 |  |
| ap-southeast-3 | 0.874 |  |
| ap-southeast-4 | 0.762 |  |
| ap-southeast-5 | 0.838 |  |
| ap-southeast-6 | 0.756 |  |
| ap-southeast-7 | 0.925 |  |
| ca-central-1 | 0.177 | 16 |
| ca-west-1 | 0.265 |  |
| eu-central-1 | 0.459 |  |
| eu-central-2 | 0.482 |  |
| eu-north-1 | 0.504 |  |
| eu-south-1 | 0.501 |  |
| eu-south-2 | 0.494 |  |
| eu-west-1 | 0.382 |  |
| eu-west-2 | 0.424 |  |
| eu-west-3 | 0.442 |  |
| il-central-1 | 0.617 |  |
| me-central-1 | 0.864 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.574 |  |
| us-east-1 | 0.127 | 4853 |
| us-east-2 | 0.147 | 1656 |
| us-gov-east-1 | 0.131 | 1739 |
| us-gov-west-1 | 0.234 | 202 |
| us-west-1 | 0.181 | 3770 |
| us-west-2 | 0.236 | 165 |

