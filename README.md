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
Updated: 2026-02-24T09:43:54.563976+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.968 |  |
| ap-east-1 | 0.724 |  |
| ap-east-2 | 0.654 |  |
| ap-northeast-1 | 0.539 |  |
| ap-northeast-2 | 0.649 |  |
| ap-northeast-3 | 0.565 |  |
| ap-south-1 | 0.929 |  |
| ap-south-2 | 0.956 |  |
| ap-southeast-1 | 0.796 |  |
| ap-southeast-2 | 0.719 |  |
| ap-southeast-3 | 0.851 |  |
| ap-southeast-4 | 0.757 |  |
| ap-southeast-5 | 0.818 |  |
| ap-southeast-6 | 0.785 |  |
| ap-southeast-7 | 0.900 |  |
| ca-central-1 | 0.192 | 16 |
| ca-west-1 | 0.256 |  |
| eu-central-1 | 0.479 |  |
| eu-central-2 | 0.502 |  |
| eu-north-1 | 0.523 |  |
| eu-south-1 | 0.501 |  |
| eu-south-2 | 0.514 |  |
| eu-west-1 | 0.402 |  |
| eu-west-2 | 0.444 |  |
| eu-west-3 | 0.457 |  |
| il-central-1 | 0.679 |  |
| me-central-1 | 0.865 |  |
| me-south-1 | 0.831 |  |
| mx-central-1 | 0.212 |  |
| sa-east-1 | 0.584 |  |
| us-east-1 | 0.135 | 4175 |
| us-east-2 | 0.139 | 1374 |
| us-gov-east-1 | 0.136 | 1503 |
| us-gov-west-1 | 0.226 | 161 |
| us-west-1 | 0.188 | 3111 |
| us-west-2 | 0.229 | 130 |

