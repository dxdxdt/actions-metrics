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
Updated: 2026-07-31T02:01:45.352960+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.983 |  |
| ap-east-1 | 0.699 |  |
| ap-east-2 | 0.638 |  |
| ap-northeast-1 | 0.520 |  |
| ap-northeast-2 | 0.623 |  |
| ap-northeast-3 | 0.546 |  |
| ap-south-1 | 0.926 |  |
| ap-south-2 | 0.964 |  |
| ap-southeast-1 | 0.774 |  |
| ap-southeast-2 | 0.686 |  |
| ap-southeast-3 | 0.831 |  |
| ap-southeast-4 | 0.734 |  |
| ap-southeast-5 | 0.795 |  |
| ap-southeast-6 | 0.723 |  |
| ap-southeast-7 | 0.879 |  |
| ca-central-1 | 0.203 | 17 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.502 |  |
| eu-central-2 | 0.532 |  |
| eu-north-1 | 0.538 |  |
| eu-south-1 | 0.522 |  |
| eu-south-2 | 0.532 |  |
| eu-west-1 | 0.413 |  |
| eu-west-2 | 0.461 |  |
| eu-west-3 | 0.485 |  |
| il-central-1 | 0.648 |  |
| me-central-1 | 0.906 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.209 |  |
| sa-east-1 | 0.613 |  |
| us-east-1 | 0.165 | 4923 |
| us-east-2 | 0.170 | 1672 |
| us-gov-east-1 | 0.135 | 1789 |
| us-gov-west-1 | 0.203 | 208 |
| us-west-1 | 0.150 | 3858 |
| us-west-2 | 0.201 | 172 |

