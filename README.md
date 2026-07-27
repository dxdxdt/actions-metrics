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
Updated: 2026-07-27T22:59:38.542825+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.963 |  |
| ap-east-1 | 0.716 |  |
| ap-east-2 | 0.656 |  |
| ap-northeast-1 | 0.535 |  |
| ap-northeast-2 | 0.639 |  |
| ap-northeast-3 | 0.563 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.927 |  |
| ap-southeast-1 | 0.796 |  |
| ap-southeast-2 | 0.694 |  |
| ap-southeast-3 | 0.845 |  |
| ap-southeast-4 | 0.736 |  |
| ap-southeast-5 | 0.816 |  |
| ap-southeast-6 | 0.721 |  |
| ap-southeast-7 | 0.902 |  |
| ca-central-1 | 0.184 | 17 |
| ca-west-1 | 0.249 |  |
| eu-central-1 | 0.475 |  |
| eu-central-2 | 0.503 |  |
| eu-north-1 | 0.539 |  |
| eu-south-1 | 0.507 |  |
| eu-south-2 | 0.515 |  |
| eu-west-1 | 0.395 |  |
| eu-west-2 | 0.431 |  |
| eu-west-3 | 0.457 |  |
| il-central-1 | 0.642 |  |
| me-central-1 | 0.875 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.212 |  |
| sa-east-1 | 0.601 |  |
| us-east-1 | 0.159 | 4914 |
| us-east-2 | 0.131 | 1670 |
| us-gov-east-1 | 0.126 | 1781 |
| us-gov-west-1 | 0.220 | 207 |
| us-west-1 | 0.159 | 3844 |
| us-west-2 | 0.219 | 170 |

