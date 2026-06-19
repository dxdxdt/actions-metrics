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
Updated: 2026-06-19T03:33:50.045095+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.987 |  |
| ap-east-1 | 0.678 |  |
| ap-east-2 | 0.612 |  |
| ap-northeast-1 | 0.497 |  |
| ap-northeast-2 | 0.605 |  |
| ap-northeast-3 | 0.521 |  |
| ap-south-1 | 0.908 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.754 |  |
| ap-southeast-2 | 0.651 |  |
| ap-southeast-3 | 0.815 |  |
| ap-southeast-4 | 0.704 |  |
| ap-southeast-5 | 0.775 |  |
| ap-southeast-6 | 0.692 |  |
| ap-southeast-7 | 0.861 |  |
| ca-central-1 | 0.256 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.514 |  |
| eu-central-2 | 0.538 |  |
| eu-north-1 | 0.554 |  |
| eu-south-1 | 0.541 |  |
| eu-south-2 | 0.537 |  |
| eu-west-1 | 0.429 |  |
| eu-west-2 | 0.466 |  |
| eu-west-3 | 0.483 |  |
| il-central-1 | 0.660 |  |
| me-central-1 | 0.928 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.619 |  |
| us-east-1 | 0.178 | 4771 |
| us-east-2 | 0.208 | 1635 |
| us-gov-east-1 | 0.186 | 1714 |
| us-gov-west-1 | 0.184 | 198 |
| us-west-1 | 0.129 | 3679 |
| us-west-2 | 0.184 | 163 |

