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
Updated: 2026-06-18T23:47:01.920715+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.940 |  |
| ap-east-1 | 0.724 |  |
| ap-east-2 | 0.662 |  |
| ap-northeast-1 | 0.547 |  |
| ap-northeast-2 | 0.650 |  |
| ap-northeast-3 | 0.570 |  |
| ap-south-1 | 0.876 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.800 |  |
| ap-southeast-2 | 0.705 |  |
| ap-southeast-3 | 0.854 |  |
| ap-southeast-4 | 0.756 |  |
| ap-southeast-5 | 0.819 |  |
| ap-southeast-6 | 0.738 |  |
| ap-southeast-7 | 0.910 |  |
| ca-central-1 | 0.205 | 16 |
| ca-west-1 | 0.253 |  |
| eu-central-1 | 0.472 |  |
| eu-central-2 | 0.493 |  |
| eu-north-1 | 0.505 |  |
| eu-south-1 | 0.494 |  |
| eu-south-2 | 0.496 |  |
| eu-west-1 | 0.384 |  |
| eu-west-2 | 0.420 |  |
| eu-west-3 | 0.438 |  |
| il-central-1 | 0.617 |  |
| me-central-1 | 0.865 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.570 |  |
| us-east-1 | 0.136 | 4771 |
| us-east-2 | 0.168 | 1635 |
| us-gov-east-1 | 0.153 | 1714 |
| us-gov-west-1 | 0.227 | 198 |
| us-west-1 | 0.178 | 3678 |
| us-west-2 | 0.226 | 163 |

