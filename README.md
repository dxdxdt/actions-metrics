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
Updated: 2026-03-18T14:18:25.326514+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.890 |  |
| ap-east-1 | 0.795 |  |
| ap-east-2 | 0.730 |  |
| ap-northeast-1 | 0.609 |  |
| ap-northeast-2 | 0.735 |  |
| ap-northeast-3 | 0.650 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.932 |  |
| ap-southeast-1 | 0.871 |  |
| ap-southeast-2 | 0.765 |  |
| ap-southeast-3 | 0.921 |  |
| ap-southeast-4 | 0.807 |  |
| ap-southeast-5 | 0.914 |  |
| ap-southeast-6 | 0.817 |  |
| ap-southeast-7 | 0.978 |  |
| ca-central-1 | 0.111 | 16 |
| ca-west-1 | 0.288 |  |
| eu-central-1 | 0.412 |  |
| eu-central-2 | 0.427 |  |
| eu-north-1 | 0.464 |  |
| eu-south-1 | 0.440 |  |
| eu-south-2 | 0.447 |  |
| eu-west-1 | 0.336 |  |
| eu-west-2 | 0.365 |  |
| eu-west-3 | 0.390 |  |
| il-central-1 | 0.579 |  |
| me-central-1 | 0.786 |  |
| me-south-1 | 0.746 |  |
| mx-central-1 | 0.296 |  |
| sa-east-1 | 0.500 |  |
| us-east-1 | 0.067 | 4303 |
| us-east-2 | 0.089 | 1433 |
| us-gov-east-1 | 0.093 | 1586 |
| us-gov-west-1 | 0.286 | 189 |
| us-west-1 | 0.244 | 3250 |
| us-west-2 | 0.286 | 148 |

