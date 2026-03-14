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
Updated: 2026-03-14T01:18:51.504434+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.935 |  |
| ap-east-1 | 0.742 |  |
| ap-east-2 | 0.678 |  |
| ap-northeast-1 | 0.557 |  |
| ap-northeast-2 | 0.668 |  |
| ap-northeast-3 | 0.582 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.911 |  |
| ap-southeast-1 | 0.817 |  |
| ap-southeast-2 | 0.715 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.757 |  |
| ap-southeast-5 | 0.837 |  |
| ap-southeast-6 | 0.764 |  |
| ap-southeast-7 | 0.934 |  |
| ca-central-1 | 0.168 | 16 |
| ca-west-1 | 0.253 |  |
| eu-central-1 | 0.445 |  |
| eu-central-2 | 0.466 |  |
| eu-north-1 | 0.508 |  |
| eu-south-1 | 0.488 |  |
| eu-south-2 | 0.490 |  |
| eu-west-1 | 0.379 |  |
| eu-west-2 | 0.416 |  |
| eu-west-3 | 0.427 |  |
| il-central-1 | 0.636 |  |
| me-central-1 | 0.820 |  |
| me-south-1 | 0.780 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.554 |  |
| us-east-1 | 0.115 | 4278 |
| us-east-2 | 0.128 | 1422 |
| us-gov-east-1 | 0.134 | 1572 |
| us-gov-west-1 | 0.240 | 183 |
| us-west-1 | 0.194 | 3221 |
| us-west-2 | 0.241 | 146 |

