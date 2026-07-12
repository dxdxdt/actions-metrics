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
Updated: 2026-07-12T11:52:51.124238+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.961 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.675 |  |
| ap-northeast-1 | 0.561 |  |
| ap-northeast-2 | 0.663 |  |
| ap-northeast-3 | 0.586 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.812 |  |
| ap-southeast-2 | 0.705 |  |
| ap-southeast-3 | 0.867 |  |
| ap-southeast-4 | 0.746 |  |
| ap-southeast-5 | 0.832 |  |
| ap-southeast-6 | 0.734 |  |
| ap-southeast-7 | 0.916 |  |
| ca-central-1 | 0.168 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.474 |  |
| eu-central-2 | 0.493 |  |
| eu-north-1 | 0.516 |  |
| eu-south-1 | 0.512 |  |
| eu-south-2 | 0.507 |  |
| eu-west-1 | 0.402 |  |
| eu-west-2 | 0.437 |  |
| eu-west-3 | 0.455 |  |
| il-central-1 | 0.632 |  |
| me-central-1 | 0.855 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.587 |  |
| us-east-1 | 0.131 | 4854 |
| us-east-2 | 0.135 | 1656 |
| us-gov-east-1 | 0.119 | 1740 |
| us-gov-west-1 | 0.226 | 202 |
| us-west-1 | 0.165 | 3771 |
| us-west-2 | 0.227 | 165 |

