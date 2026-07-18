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
Updated: 2026-07-18T23:44:42.142127+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.984 |  |
| ap-east-1 | 0.697 |  |
| ap-east-2 | 0.640 |  |
| ap-northeast-1 | 0.523 |  |
| ap-northeast-2 | 0.629 |  |
| ap-northeast-3 | 0.549 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.774 |  |
| ap-southeast-2 | 0.665 |  |
| ap-southeast-3 | 0.835 |  |
| ap-southeast-4 | 0.710 |  |
| ap-southeast-5 | 0.796 |  |
| ap-southeast-6 | 0.701 |  |
| ap-southeast-7 | 0.876 |  |
| ca-central-1 | 0.215 | 16 |
| ca-west-1 | 0.222 |  |
| eu-central-1 | 0.504 |  |
| eu-central-2 | 0.532 |  |
| eu-north-1 | 0.549 |  |
| eu-south-1 | 0.538 |  |
| eu-south-2 | 0.543 |  |
| eu-west-1 | 0.443 |  |
| eu-west-2 | 0.476 |  |
| eu-west-3 | 0.484 |  |
| il-central-1 | 0.669 |  |
| me-central-1 | 0.886 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.617 |  |
| us-east-1 | 0.173 | 4883 |
| us-east-2 | 0.176 | 1657 |
| us-gov-east-1 | 0.166 | 1769 |
| us-gov-west-1 | 0.188 | 203 |
| us-west-1 | 0.137 | 3800 |
| us-west-2 | 0.188 | 167 |

