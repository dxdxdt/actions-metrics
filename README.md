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
Updated: 2026-08-15T22:12:52.879117+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.925 |  |
| ap-east-1 | 0.747 |  |
| ap-east-2 | 0.673 |  |
| ap-northeast-1 | 0.554 |  |
| ap-northeast-2 | 0.653 |  |
| ap-northeast-3 | 0.592 |  |
| ap-south-1 | 0.856 |  |
| ap-south-2 | 0.886 |  |
| ap-southeast-1 | 0.827 |  |
| ap-southeast-2 | 0.701 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.752 |  |
| ap-southeast-5 | 0.840 |  |
| ap-southeast-6 | 0.754 |  |
| ap-southeast-7 | 0.926 |  |
| ca-central-1 | 0.191 | 18 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.448 |  |
| eu-central-2 | 0.477 |  |
| eu-north-1 | 0.510 |  |
| eu-south-1 | 0.485 |  |
| eu-south-2 | 0.484 |  |
| eu-west-1 | 0.386 |  |
| eu-west-2 | 0.412 |  |
| eu-west-3 | 0.435 |  |
| il-central-1 | 0.625 |  |
| me-central-1 | 0.860 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.567 |  |
| us-east-1 | 0.124 | 5004 |
| us-east-2 | 0.153 | 1679 |
| us-gov-east-1 | 0.155 | 1831 |
| us-gov-west-1 | 0.244 | 222 |
| us-west-1 | 0.181 | 3960 |
| us-west-2 | 0.244 | 178 |

