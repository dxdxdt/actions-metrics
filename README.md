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
Updated: 2026-09-19T00:50:57.988101+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.935 |  |
| ap-east-1 | 0.752 |  |
| ap-east-2 | 0.684 |  |
| ap-northeast-1 | 0.571 |  |
| ap-northeast-2 | 0.673 |  |
| ap-northeast-3 | 0.599 |  |
| ap-south-1 | 0.875 |  |
| ap-south-2 | 0.963 |  |
| ap-southeast-1 | 0.850 |  |
| ap-southeast-2 | 0.722 |  |
| ap-southeast-3 | 0.881 |  |
| ap-southeast-4 | 0.766 |  |
| ap-southeast-5 | 0.848 |  |
| ap-southeast-6 | 0.751 |  |
| ap-southeast-7 | 0.926 |  |
| ca-central-1 | 0.127 | 18 |
| ca-west-1 | 0.217 |  |
| eu-central-1 | 0.439 |  |
| eu-central-2 | 0.473 |  |
| eu-north-1 | 0.483 |  |
| eu-south-1 | 0.469 |  |
| eu-south-2 | 0.512 |  |
| eu-west-1 | 0.355 |  |
| eu-west-2 | 0.395 |  |
| eu-west-3 | 0.429 |  |
| il-central-1 | 0.615 |  |
| me-central-1 | 0.818 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.576 |  |
| us-east-1 | 0.097 | 5105 |
| us-east-2 | 0.110 | 1686 |
| us-gov-east-1 | 0.083 | 1918 |
| us-gov-west-1 | 0.239 | 234 |
| us-west-1 | 0.184 | 4125 |
| us-west-2 | 0.241 | 192 |

