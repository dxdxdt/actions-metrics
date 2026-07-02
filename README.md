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
Updated: 2026-07-02T12:04:37.220833+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.961 |  |
| ap-east-1 | 0.728 |  |
| ap-east-2 | 0.661 |  |
| ap-northeast-1 | 0.544 |  |
| ap-northeast-2 | 0.646 |  |
| ap-northeast-3 | 0.569 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.802 |  |
| ap-southeast-2 | 0.689 |  |
| ap-southeast-3 | 0.859 |  |
| ap-southeast-4 | 0.746 |  |
| ap-southeast-5 | 0.824 |  |
| ap-southeast-6 | 0.732 |  |
| ap-southeast-7 | 0.907 |  |
| ca-central-1 | 0.212 | 16 |
| ca-west-1 | 0.256 |  |
| eu-central-1 | 0.481 |  |
| eu-central-2 | 0.512 |  |
| eu-north-1 | 0.518 |  |
| eu-south-1 | 0.515 |  |
| eu-south-2 | 0.515 |  |
| eu-west-1 | 0.403 |  |
| eu-west-2 | 0.448 |  |
| eu-west-3 | 0.456 |  |
| il-central-1 | 0.649 |  |
| me-central-1 | 0.857 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.587 |  |
| us-east-1 | 0.141 | 4811 |
| us-east-2 | 0.203 | 1650 |
| us-gov-east-1 | 0.169 | 1727 |
| us-gov-west-1 | 0.226 | 200 |
| us-west-1 | 0.170 | 3727 |
| us-west-2 | 0.229 | 164 |

