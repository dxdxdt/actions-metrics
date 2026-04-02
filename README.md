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
Updated: 2026-04-02T09:05:16.289129+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.986 |  |
| ap-east-1 | 0.717 |  |
| ap-east-2 | 0.662 |  |
| ap-northeast-1 | 0.539 |  |
| ap-northeast-2 | 0.650 |  |
| ap-northeast-3 | 0.574 |  |
| ap-south-1 | 0.942 |  |
| ap-south-2 | 0.931 |  |
| ap-southeast-1 | 0.790 |  |
| ap-southeast-2 | 0.692 |  |
| ap-southeast-3 | 0.851 |  |
| ap-southeast-4 | 0.744 |  |
| ap-southeast-5 | 0.824 |  |
| ap-southeast-6 | 0.806 |  |
| ap-southeast-7 | 0.903 |  |
| ca-central-1 | 0.160 | 16 |
| ca-west-1 | 0.319 |  |
| eu-central-1 | 0.502 |  |
| eu-central-2 | 0.515 |  |
| eu-north-1 | 0.545 |  |
| eu-south-1 | 0.517 |  |
| eu-south-2 | 0.535 |  |
| eu-west-1 | 0.416 |  |
| eu-west-2 | 0.454 |  |
| eu-west-3 | 0.479 |  |
| il-central-1 | 0.657 |  |
| me-central-1 | 0.862 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.616 |  |
| us-east-1 | 0.139 | 4418 |
| us-east-2 | 0.124 | 1472 |
| us-gov-east-1 | 0.108 | 1621 |
| us-gov-west-1 | 0.211 | 190 |
| us-west-1 | 0.166 | 3335 |
| us-west-2 | 0.209 | 153 |

