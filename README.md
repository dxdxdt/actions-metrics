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
Updated: 2026-07-23T05:29:43.032631+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.905 |  |
| ap-east-1 | 0.766 |  |
| ap-east-2 | 0.709 |  |
| ap-northeast-1 | 0.586 |  |
| ap-northeast-2 | 0.695 |  |
| ap-northeast-3 | 0.612 |  |
| ap-south-1 | 0.862 |  |
| ap-south-2 | 0.929 |  |
| ap-southeast-1 | 0.844 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.904 |  |
| ap-southeast-4 | 0.792 |  |
| ap-southeast-5 | 0.865 |  |
| ap-southeast-6 | 0.781 |  |
| ap-southeast-7 | 0.951 |  |
| ca-central-1 | 0.164 | 16 |
| ca-west-1 | 0.286 |  |
| eu-central-1 | 0.419 |  |
| eu-central-2 | 0.438 |  |
| eu-north-1 | 0.483 |  |
| eu-south-1 | 0.446 |  |
| eu-south-2 | 0.455 |  |
| eu-west-1 | 0.343 |  |
| eu-west-2 | 0.382 |  |
| eu-west-3 | 0.403 |  |
| il-central-1 | 0.584 |  |
| me-central-1 | 0.819 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.532 |  |
| us-east-1 | 0.093 | 4901 |
| us-east-2 | 0.131 | 1660 |
| us-gov-east-1 | 0.127 | 1775 |
| us-gov-west-1 | 0.268 | 206 |
| us-west-1 | 0.212 | 3820 |
| us-west-2 | 0.272 | 167 |

