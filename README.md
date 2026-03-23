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
Updated: 2026-03-23T16:50:48.549455+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.985 |  |
| ap-east-1 | 0.718 |  |
| ap-east-2 | 0.661 |  |
| ap-northeast-1 | 0.537 |  |
| ap-northeast-2 | 0.651 |  |
| ap-northeast-3 | 0.564 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.923 |  |
| ap-southeast-1 | 0.798 |  |
| ap-southeast-2 | 0.699 |  |
| ap-southeast-3 | 0.845 |  |
| ap-southeast-4 | 0.737 |  |
| ap-southeast-5 | 0.824 |  |
| ap-southeast-6 | 0.738 |  |
| ap-southeast-7 | 0.902 |  |
| ca-central-1 | 0.175 | 16 |
| ca-west-1 | 0.200 |  |
| eu-central-1 | 0.505 |  |
| eu-central-2 | 0.514 |  |
| eu-north-1 | 0.559 |  |
| eu-south-1 | 0.523 |  |
| eu-south-2 | 0.531 |  |
| eu-west-1 | 0.416 |  |
| eu-west-2 | 0.449 |  |
| eu-west-3 | 0.478 |  |
| il-central-1 | 0.657 |  |
| me-central-1 | 0.870 |  |
| me-south-1 | 0.819 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.602 |  |
| us-east-1 | 0.147 | 4339 |
| us-east-2 | 0.123 | 1449 |
| us-gov-east-1 | 0.128 | 1596 |
| us-gov-west-1 | 0.204 | 190 |
| us-west-1 | 0.176 | 3287 |
| us-west-2 | 0.203 | 151 |

