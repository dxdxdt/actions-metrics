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
Updated: 2026-06-01T10:13:05.941681+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.017 |  |
| ap-east-1 | 0.655 |  |
| ap-east-2 | 0.585 |  |
| ap-northeast-1 | 0.470 |  |
| ap-northeast-2 | 0.576 |  |
| ap-northeast-3 | 0.495 |  |
| ap-south-1 | 0.914 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.732 |  |
| ap-southeast-2 | 0.631 |  |
| ap-southeast-3 | 0.790 |  |
| ap-southeast-4 | 0.671 |  |
| ap-southeast-5 | 0.752 |  |
| ap-southeast-6 | 0.670 |  |
| ap-southeast-7 | 0.832 |  |
| ca-central-1 | 0.280 | 16 |
| ca-west-1 | 0.221 |  |
| eu-central-1 | 0.544 |  |
| eu-central-2 | 0.556 |  |
| eu-north-1 | 0.582 |  |
| eu-south-1 | 0.577 |  |
| eu-south-2 | 0.564 |  |
| eu-west-1 | 0.453 |  |
| eu-west-2 | 0.512 |  |
| eu-west-3 | 0.509 |  |
| il-central-1 | 0.688 |  |
| me-central-1 | 0.952 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.659 |  |
| us-east-1 | 0.203 | 4710 |
| us-east-2 | 0.225 | 1617 |
| us-gov-east-1 | 0.206 | 1708 |
| us-gov-west-1 | 0.163 | 196 |
| us-west-1 | 0.103 | 3628 |
| us-west-2 | 0.164 | 161 |

