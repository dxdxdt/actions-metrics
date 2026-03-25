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
Updated: 2026-03-25T04:13:18.266073+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.992 |  |
| ap-east-1 | 0.723 |  |
| ap-east-2 | 0.680 |  |
| ap-northeast-1 | 0.538 |  |
| ap-northeast-2 | 0.644 |  |
| ap-northeast-3 | 0.568 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.900 |  |
| ap-southeast-1 | 0.791 |  |
| ap-southeast-2 | 0.706 |  |
| ap-southeast-3 | 0.843 |  |
| ap-southeast-4 | 0.748 |  |
| ap-southeast-5 | 0.807 |  |
| ap-southeast-6 | 0.756 |  |
| ap-southeast-7 | 0.900 |  |
| ca-central-1 | 0.165 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.503 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.544 |  |
| eu-south-1 | 0.517 |  |
| eu-south-2 | 0.529 |  |
| eu-west-1 | 0.422 |  |
| eu-west-2 | 0.444 |  |
| eu-west-3 | 0.474 |  |
| il-central-1 | 0.681 |  |
| me-central-1 | 0.867 |  |
| me-south-1 | 0.828 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.609 |  |
| us-east-1 | 0.139 | 4354 |
| us-east-2 | 0.118 | 1451 |
| us-gov-east-1 | 0.121 | 1601 |
| us-gov-west-1 | 0.214 | 190 |
| us-west-1 | 0.164 | 3293 |
| us-west-2 | 0.213 | 151 |

