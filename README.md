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
Updated: 2026-07-18T01:46:19.529512+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.992 |  |
| ap-east-1 | 0.698 |  |
| ap-east-2 | 0.635 |  |
| ap-northeast-1 | 0.571 |  |
| ap-northeast-2 | 0.627 |  |
| ap-northeast-3 | 0.540 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.959 |  |
| ap-southeast-1 | 0.766 |  |
| ap-southeast-2 | 0.663 |  |
| ap-southeast-3 | 0.823 |  |
| ap-southeast-4 | 0.705 |  |
| ap-southeast-5 | 0.801 |  |
| ap-southeast-6 | 0.690 |  |
| ap-southeast-7 | 0.870 |  |
| ca-central-1 | 0.186 | 16 |
| ca-west-1 | 0.224 |  |
| eu-central-1 | 0.513 |  |
| eu-central-2 | 0.535 |  |
| eu-north-1 | 0.551 |  |
| eu-south-1 | 0.538 |  |
| eu-south-2 | 0.551 |  |
| eu-west-1 | 0.446 |  |
| eu-west-2 | 0.478 |  |
| eu-west-3 | 0.501 |  |
| il-central-1 | 0.671 |  |
| me-central-1 | 0.876 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.199 |  |
| sa-east-1 | 0.646 |  |
| us-east-1 | 0.164 | 4877 |
| us-east-2 | 0.159 | 1657 |
| us-gov-east-1 | 0.128 | 1766 |
| us-gov-west-1 | 0.184 | 203 |
| us-west-1 | 0.128 | 3794 |
| us-west-2 | 0.184 | 166 |

