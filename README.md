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
Updated: 2026-08-13T11:41:14.522373+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.960 |  |
| ap-east-1 | 0.727 |  |
| ap-east-2 | 0.671 |  |
| ap-northeast-1 | 0.545 |  |
| ap-northeast-2 | 0.653 |  |
| ap-northeast-3 | 0.573 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.940 |  |
| ap-southeast-1 | 0.807 |  |
| ap-southeast-2 | 0.712 |  |
| ap-southeast-3 | 0.862 |  |
| ap-southeast-4 | 0.743 |  |
| ap-southeast-5 | 0.826 |  |
| ap-southeast-6 | 0.763 |  |
| ap-southeast-7 | 0.917 |  |
| ca-central-1 | 0.207 | 18 |
| ca-west-1 | 0.253 |  |
| eu-central-1 | 0.473 |  |
| eu-central-2 | 0.490 |  |
| eu-north-1 | 0.538 |  |
| eu-south-1 | 0.495 |  |
| eu-south-2 | 0.508 |  |
| eu-west-1 | 0.400 |  |
| eu-west-2 | 0.431 |  |
| eu-west-3 | 0.450 |  |
| il-central-1 | 0.630 |  |
| me-central-1 | 0.881 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.574 |  |
| us-east-1 | 0.136 | 4985 |
| us-east-2 | 0.163 | 1679 |
| us-gov-east-1 | 0.158 | 1823 |
| us-gov-west-1 | 0.242 | 222 |
| us-west-1 | 0.169 | 3938 |
| us-west-2 | 0.235 | 176 |

