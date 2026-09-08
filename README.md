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
Updated: 2026-09-08T22:13:52.167258+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.964 |  |
| ap-east-1 | 0.714 |  |
| ap-east-2 | 0.652 |  |
| ap-northeast-1 | 0.534 |  |
| ap-northeast-2 | 0.637 |  |
| ap-northeast-3 | 0.559 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.812 |  |
| ap-southeast-2 | 0.682 |  |
| ap-southeast-3 | 0.847 |  |
| ap-southeast-4 | 0.733 |  |
| ap-southeast-5 | 0.807 |  |
| ap-southeast-6 | 0.728 |  |
| ap-southeast-7 | 0.898 |  |
| ca-central-1 | 0.207 | 18 |
| ca-west-1 | 0.231 |  |
| eu-central-1 | 0.472 |  |
| eu-central-2 | 0.493 |  |
| eu-north-1 | 0.538 |  |
| eu-south-1 | 0.511 |  |
| eu-south-2 | 0.509 |  |
| eu-west-1 | 0.398 |  |
| eu-west-2 | 0.435 |  |
| eu-west-3 | 0.455 |  |
| il-central-1 | 0.636 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.216 |  |
| sa-east-1 | 0.588 |  |
| us-east-1 | 0.144 | 5093 |
| us-east-2 | 0.172 | 1685 |
| us-gov-east-1 | 0.178 | 1903 |
| us-gov-west-1 | 0.221 | 231 |
| us-west-1 | 0.161 | 4091 |
| us-west-2 | 0.221 | 192 |

